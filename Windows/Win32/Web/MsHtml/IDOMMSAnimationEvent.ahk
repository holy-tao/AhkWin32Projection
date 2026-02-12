#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMMSAnimationEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMMSAnimationEvent
     * @type {Guid}
     */
    static IID => Guid("{305107b7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMMSAnimationEvent
     * @type {Guid}
     */
    static CLSID => Guid("{305107b8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_animationName", "get_elapsedTime", "initMSAnimationEvent"]

    /**
     * @type {BSTR} 
     */
    animationName {
        get => this.get_animationName()
    }

    /**
     * @type {Float} 
     */
    elapsedTime {
        get => this.get_elapsedTime()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationName() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_elapsedTime() {
        result := ComCall(8, this, "float*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {BSTR} animationName 
     * @param {Float} elapsedTime 
     * @returns {HRESULT} 
     */
    initMSAnimationEvent(eventType, canBubble, cancelable, animationName, elapsedTime) {
        if(eventType is String) {
            pin := BSTR.Alloc(eventType)
            eventType := pin.Value
        }
        if(animationName is String) {
            pin := BSTR.Alloc(animationName)
            animationName := pin.Value
        }

        result := ComCall(9, this, "ptr", eventType, "short", canBubble, "short", cancelable, "ptr", animationName, "float", elapsedTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
