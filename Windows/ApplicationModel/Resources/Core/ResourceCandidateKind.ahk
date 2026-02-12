#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the type of resource that is encapsulated in a [ResourceCandidate](resourcecandidate.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcecandidatekind
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceCandidateKind extends Win32Enum{

    /**
     * The resource is a string.
     * @type {Integer (Int32)}
     */
    static String => 0

    /**
     * The resource is a file.
     * @type {Integer (Int32)}
     */
    static File => 1

    /**
     * The resource is embedded data in some containing resource file (such as a .resw file).
     * @type {Integer (Int32)}
     */
    static EmbeddedData => 2
}
