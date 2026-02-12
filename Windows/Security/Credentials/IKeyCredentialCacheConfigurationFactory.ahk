#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\KeyCredentialCacheConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IKeyCredentialCacheConfigurationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyCredentialCacheConfigurationFactory
     * @type {Guid}
     */
    static IID => Guid("{9948c31b-c827-5b58-9442-40acd8ab1e7d}")

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
     * @param {Integer} cacheOption 
     * @param {TimeSpan} timeout 
     * @param {Integer} usageCount 
     * @returns {KeyCredentialCacheConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(cacheOption, timeout, usageCount) {
        result := ComCall(6, this, "int", cacheOption, "ptr", timeout, "uint", usageCount, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyCredentialCacheConfiguration(result_)
    }
}
