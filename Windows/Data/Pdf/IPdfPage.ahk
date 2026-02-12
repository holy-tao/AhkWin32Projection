#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include .\PdfPageDimensions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class IPdfPage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdfPage
     * @type {Guid}
     */
    static IID => Guid("{9db4b0c8-5320-4cfc-ad76-493fdad0e594}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenderToStreamAsync", "RenderWithOptionsToStreamAsync", "PreparePageAsync", "get_Index", "get_Size", "get_Dimensions", "get_Rotation", "get_PreferredZoom"]

    /**
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {PdfPageDimensions} 
     */
    Dimensions {
        get => this.get_Dimensions()
    }

    /**
     * @type {Integer} 
     */
    Rotation {
        get => this.get_Rotation()
    }

    /**
     * @type {Float} 
     */
    PreferredZoom {
        get => this.get_PreferredZoom()
    }

    /**
     * 
     * @param {IRandomAccessStream} outputStream 
     * @returns {IAsyncAction} 
     */
    RenderToStreamAsync(outputStream) {
        result := ComCall(6, this, "ptr", outputStream, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {IRandomAccessStream} outputStream 
     * @param {PdfPageRenderOptions} options 
     * @returns {IAsyncAction} 
     */
    RenderWithOptionsToStreamAsync(outputStream, options) {
        result := ComCall(7, this, "ptr", outputStream, "ptr", options, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    PreparePageAsync() {
        result := ComCall(8, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Index() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        value := SIZE()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PdfPageDimensions} 
     */
    get_Dimensions() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PdfPageDimensions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rotation() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PreferredZoom() {
        result := ComCall(13, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
