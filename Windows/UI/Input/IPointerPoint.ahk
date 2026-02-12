#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Input\PointerDevice.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include .\PointerPointProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides generalized transformation functions.
 * @remarks
 * Do not call this interface directly. IPointerPointTransform is used by a [GestureRecognizer](gesturerecognizer.md) to get transformation information for an input pointer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.ipointerpointtransform
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IPointerPoint extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerPoint
     * @type {Guid}
     */
    static IID => Guid("{e995317d-7296-42d9-8233-c5be73b74a4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerDevice", "get_Position", "get_RawPosition", "get_PointerId", "get_FrameId", "get_Timestamp", "get_IsInContact", "get_Properties"]

    /**
     * @type {PointerDevice} 
     */
    PointerDevice {
        get => this.get_PointerDevice()
    }

    /**
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {POINT} 
     */
    RawPosition {
        get => this.get_RawPosition()
    }

    /**
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

    /**
     * @type {Integer} 
     */
    FrameId {
        get => this.get_FrameId()
    }

    /**
     * @type {Integer} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {Boolean} 
     */
    IsInContact {
        get => this.get_IsInContact()
    }

    /**
     * @type {PointerPointProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {PointerDevice} 
     */
    get_PointerDevice() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerDevice(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RawPosition() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerId() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameId() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timestamp() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInContact() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PointerPointProperties} 
     */
    get_Properties() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerPointProperties(value)
    }
}
