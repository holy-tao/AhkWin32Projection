#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class Iwfolders extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Iwfolders
     * @type {Guid}
     */
    static IID => Guid("{bae31f98-1b81-11d2-a97a-00c04f8ecb02}")

    /**
     * The class identifier for wfolders
     * @type {Guid}
     */
    static CLSID => Guid("{bae31f9a-1b81-11d2-a97a-00c04f8ecb02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["navigate", "navigateFrame", "navigateNoSite"]

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {BSTR} 
     */
    navigate(bstrUrl) {
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }

        pbstrRetVal := BSTR()
        result := ComCall(7, this, "ptr", bstrUrl, "ptr", pbstrRetVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrRetVal
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bstrTargetFrame 
     * @returns {BSTR} 
     */
    navigateFrame(bstrUrl, bstrTargetFrame) {
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }
        if(bstrTargetFrame is String) {
            pin := BSTR.Alloc(bstrTargetFrame)
            bstrTargetFrame := pin.Value
        }

        pbstrRetVal := BSTR()
        result := ComCall(8, this, "ptr", bstrUrl, "ptr", bstrTargetFrame, "ptr", pbstrRetVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrRetVal
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bstrTargetFrame 
     * @param {Integer} dwhwnd 
     * @param {IUnknown} pwb 
     * @returns {HRESULT} 
     */
    navigateNoSite(bstrUrl, bstrTargetFrame, dwhwnd, pwb) {
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }
        if(bstrTargetFrame is String) {
            pin := BSTR.Alloc(bstrTargetFrame)
            bstrTargetFrame := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrUrl, "ptr", bstrTargetFrame, "uint", dwhwnd, "ptr", pwb, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
