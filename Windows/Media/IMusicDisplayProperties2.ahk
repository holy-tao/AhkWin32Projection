#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMusicDisplayProperties2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMusicDisplayProperties2
     * @type {Guid}
     */
    static IID => Guid("{00368462-97d3-44b9-b00f-008afcefaf18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlbumTitle", "put_AlbumTitle", "get_TrackNumber", "put_TrackNumber", "get_Genres"]

    /**
     * @type {HSTRING} 
     */
    AlbumTitle {
        get => this.get_AlbumTitle()
        set => this.put_AlbumTitle(value)
    }

    /**
     * @type {Integer} 
     */
    TrackNumber {
        get => this.get_TrackNumber()
        set => this.put_TrackNumber(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    Genres {
        get => this.get_Genres()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlbumTitle() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AlbumTitle(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrackNumber() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_TrackNumber(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Genres() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
