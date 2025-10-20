#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IEventTarget extends IDispatch{
    /**
     * The interface identifier for IEventTarget
     * @type {Guid}
     */
    static IID => Guid("{305104b9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} type 
     * @param {Pointer<IDispatch>} listener 
     * @param {VARIANT_BOOL} useCapture 
     * @returns {HRESULT} 
     */
    addEventListener(type, listener, useCapture) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(7, this, "ptr", type, "ptr", listener, "short", useCapture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {Pointer<IDispatch>} listener 
     * @param {VARIANT_BOOL} useCapture 
     * @returns {HRESULT} 
     */
    removeEventListener(type, listener, useCapture) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(8, this, "ptr", type, "ptr", listener, "short", useCapture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDOMEvent>} evt 
     * @param {Pointer<VARIANT_BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    dispatchEvent(evt, pfResult) {
        result := ComCall(9, this, "ptr", evt, "ptr", pfResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
