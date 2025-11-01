#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpProviderConstruct extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFtpProviderConstruct
     * @type {Guid}
     */
    static IID => Guid("{4d1a3f7b-412d-447c-b199-64f967e9a2da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Construct"]

    /**
     * 
     * @param {Pointer<SAFEARRAY>} configurationEntries 
     * @returns {HRESULT} 
     */
    Construct(configurationEntries) {
        result := ComCall(3, this, "ptr", configurationEntries, "HRESULT")
        return result
    }
}
