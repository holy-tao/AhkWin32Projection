#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UpdatePluginVersionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdatePluginVersionInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdatePluginVersionInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{56bb98ce-543c-59f2-810d-4d2cf84ee40e}")

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
     * @param {Integer} majorVersion 
     * @param {Integer} minorVersion 
     * @param {Integer} patchLevel 
     * @returns {UpdatePluginVersionInfo} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(majorVersion, minorVersion, patchLevel) {
        result := ComCall(6, this, "uint", majorVersion, "uint", minorVersion, "uint", patchLevel, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePluginVersionInfo(value)
    }
}
