#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimedTextStyle.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedTextSubformat extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextSubformat
     * @type {Guid}
     */
    static IID => Guid("{d713502f-3261-4722-a0c2-b937b2390f14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartIndex", "put_StartIndex", "get_Length", "put_Length", "get_SubformatStyle", "put_SubformatStyle"]

    /**
     * @type {Integer} 
     */
    StartIndex {
        get => this.get_StartIndex()
        set => this.put_StartIndex(value)
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * @type {TimedTextStyle} 
     */
    SubformatStyle {
        get => this.get_SubformatStyle()
        set => this.put_SubformatStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartIndex() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StartIndex(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Length(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimedTextStyle} 
     */
    get_SubformatStyle() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextStyle(value)
    }

    /**
     * 
     * @param {TimedTextStyle} value 
     * @returns {HRESULT} 
     */
    put_SubformatStyle(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
