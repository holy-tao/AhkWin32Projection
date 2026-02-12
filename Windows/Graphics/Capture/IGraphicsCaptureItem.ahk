#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\SizeInt32.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Targets a monitor(s) for the creation of a graphics capture item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.capture.interop/nf-windows-graphics-capture-interop-igraphicscaptureiteminterop-createformonitor
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCaptureItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureItem
     * @type {Guid}
     */
    static IID => Guid("{79c3f95b-31f7-4ec2-a464-632ef5d30760}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "get_Size", "add_Closed", "remove_Closed"]

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {SizeInt32} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_Size() {
        value := SizeInt32()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<GraphicsCaptureItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
