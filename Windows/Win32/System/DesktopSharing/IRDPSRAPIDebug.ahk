#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIDebug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIDebug
     * @type {Guid}
     */
    static IID => Guid("{aa1e42b5-496d-4ca4-a690-348dcb2ec4ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_CLXCmdLine", "get_CLXCmdLine"]

    /**
     * 
     * @param {BSTR} CLXCmdLine 
     * @returns {HRESULT} 
     */
    put_CLXCmdLine(CLXCmdLine) {
        CLXCmdLine := CLXCmdLine is String ? BSTR.Alloc(CLXCmdLine).Value : CLXCmdLine

        result := ComCall(3, this, "ptr", CLXCmdLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCLXCmdLine 
     * @returns {HRESULT} 
     */
    get_CLXCmdLine(pCLXCmdLine) {
        result := ComCall(4, this, "ptr", pCLXCmdLine, "HRESULT")
        return result
    }
}
