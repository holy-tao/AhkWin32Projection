#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class IPdfPageDimensions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdfPageDimensions
     * @type {Guid}
     */
    static IID => Guid("{22170471-313e-44e8-835d-63a3e7624a10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaBox", "get_CropBox", "get_BleedBox", "get_TrimBox", "get_ArtBox"]

    /**
     * @type {RECT} 
     */
    MediaBox {
        get => this.get_MediaBox()
    }

    /**
     * @type {RECT} 
     */
    CropBox {
        get => this.get_CropBox()
    }

    /**
     * @type {RECT} 
     */
    BleedBox {
        get => this.get_BleedBox()
    }

    /**
     * @type {RECT} 
     */
    TrimBox {
        get => this.get_TrimBox()
    }

    /**
     * @type {RECT} 
     */
    ArtBox {
        get => this.get_ArtBox()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_MediaBox() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_CropBox() {
        value := RECT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BleedBox() {
        value := RECT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_TrimBox() {
        value := RECT()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ArtBox() {
        value := RECT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
