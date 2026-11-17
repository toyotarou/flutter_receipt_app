allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
// isar_community に替えたため不要になった（isar_flutter_libs 3.1.0+1 用の対処）。念のためコメントアウトで残す
// // isar_flutter_libs 3.1.0+1 は古い作りのため、今の Android ビルドに合わせて補う（app-moneynote3-3 と同じ対処）
// // ・namespace を補う
// // ・AndroidManifest.xml の package 属性を外す（今の AGP ではエラーになる）
// // ・compileSdk を 36 にする（古いままだと android:attr/lStar が見つからずにエラーになる）
// subprojects {
//     if (project.name == "isar_flutter_libs") {
//         project.afterEvaluate {
//             project.extensions.findByName("android")?.withGroovyBuilder {
//                 "setNamespace"("dev.isar.isar_flutter_libs")
//                 "setCompileSdk"(36)
//             }
//             val manifestFile = project.file("src/main/AndroidManifest.xml")
//             if (manifestFile.exists()) {
//                 manifestFile.writeText(manifestFile.readText().replace("package=\"dev.isar.isar_flutter_libs\"", ""))
//             }
//         }
//     }
// }

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
