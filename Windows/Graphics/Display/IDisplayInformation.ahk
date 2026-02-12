#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Desktop interop interface for the [DisplayInformation](/uwp/api/windows.graphics.display.displayinformation) activation factory.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.display.interop/nn-windows-graphics-display-interop-idisplayinformationstaticsinterop
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayInformation
     * @type {Guid}
     */
    static IID => Guid("{bed112ae-adc3-4dc9-ae65-851f4d7d4799}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentOrientation", "get_NativeOrientation", "add_OrientationChanged", "remove_OrientationChanged", "get_ResolutionScale", "get_LogicalDpi", "get_RawDpiX", "get_RawDpiY", "add_DpiChanged", "remove_DpiChanged", "get_StereoEnabled", "add_StereoEnabledChanged", "remove_StereoEnabledChanged", "GetColorProfileAsync", "add_ColorProfileChanged", "remove_ColorProfileChanged"]

    /**
     * @type {Integer} 
     */
    CurrentOrientation {
        get => this.get_CurrentOrientation()
    }

    /**
     * @type {Integer} 
     */
    NativeOrientation {
        get => this.get_NativeOrientation()
    }

    /**
     * @type {Integer} 
     */
    ResolutionScale {
        get => this.get_ResolutionScale()
    }

    /**
     * @type {Float} 
     */
    LogicalDpi {
        get => this.get_LogicalDpi()
    }

    /**
     * @type {Float} 
     */
    RawDpiX {
        get => this.get_RawDpiX()
    }

    /**
     * @type {Float} 
     */
    RawDpiY {
        get => this.get_RawDpiY()
    }

    /**
     * @type {Boolean} 
     */
    StereoEnabled {
        get => this.get_StereoEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentOrientation() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NativeOrientation() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OrientationChanged(handler) {
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
    remove_OrientationChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResolutionScale() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LogicalDpi() {
        result := ComCall(11, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiX() {
        result := ComCall(12, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiY() {
        result := ComCall(13, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DpiChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_DpiChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StereoEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StereoEnabledChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_StereoEnabledChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     */
    GetColorProfileAsync() {
        result := ComCall(19, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, asyncInfo)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ColorProfileChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_ColorProfileChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
