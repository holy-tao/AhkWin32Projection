#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PM_TASK_TYPE.ahk" { PM_TASK_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_APPTASKTYPE {
    #StructPack 4

    ProductID : Guid

    TaskType : PM_TASK_TYPE

}
