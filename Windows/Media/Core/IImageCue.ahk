#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimedTextPoint.ahk
#Include .\TimedTextSize.ahk
#Include ..\..\Graphics\Imaging\SoftwareBitmap.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IImageCue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageCue
     * @type {Guid}
     */
    static IID => Guid("{52828282-367b-440b-9116-3c84570dd270}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "put_Position", "get_Extent", "put_Extent", "put_SoftwareBitmap", "get_SoftwareBitmap"]

    /**
     * @type {TimedTextPoint} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * @type {TimedTextSize} 
     */
    Extent {
        get => this.get_Extent()
        set => this.put_Extent(value)
    }

    /**
     * @type {SoftwareBitmap} 
     */
    SoftwareBitmap {
        get => this.get_SoftwareBitmap()
        set => this.put_SoftwareBitmap(value)
    }

    /**
     * 
     * @returns {TimedTextPoint} 
     */
    get_Position() {
        value := TimedTextPoint()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimedTextPoint} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimedTextSize} 
     */
    get_Extent() {
        value := TimedTextSize()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimedTextSize} value 
     * @returns {HRESULT} 
     */
    put_Extent(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SoftwareBitmap} value 
     * @returns {HRESULT} 
     */
    put_SoftwareBitmap(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }
}
