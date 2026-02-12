#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsSoftwareUpdateVersion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateVersionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateVersionFactory
     * @type {Guid}
     */
    static IID => Guid("{650ed994-0858-5528-a1f2-f73ca64dabc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} major 
     * @param {Integer} minor 
     * @param {Integer} revisionMajor 
     * @param {Integer} revisionMinor 
     * @returns {WindowsSoftwareUpdateVersion} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(major, minor, revisionMajor, revisionMinor) {
        result := ComCall(6, this, "uint", major, "uint", minor, "uint", revisionMajor, "uint", revisionMinor, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateVersion(value)
    }
}
