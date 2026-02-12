#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables an object to remain inactive most of the time, yet still participate in interaction with the mouse, including drag and drop.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ipointerinactive
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IPointer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointer
     * @type {Guid}
     */
    static IID => Guid("{5ee8f39f-747d-4171-90e6-cd37a9dffb11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerId", "get_PointerDeviceType", "get_IsInContact", "get_IsInRange"]

    /**
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

    /**
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * @type {Boolean} 
     */
    IsInContact {
        get => this.get_IsInContact()
    }

    /**
     * @type {Boolean} 
     */
    IsInRange {
        get => this.get_IsInRange()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerId() {
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
    get_PointerDeviceType() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInRange() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
