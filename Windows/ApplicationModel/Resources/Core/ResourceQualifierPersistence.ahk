#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Possible values for the persistence of a global qualifier value override.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcequalifierpersistence
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceQualifierPersistence extends Win32Enum{

    /**
     * The override value is not persistent.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The override value persists on the local machine.
     * @type {Integer (Int32)}
     */
    static LocalMachine => 1
}
