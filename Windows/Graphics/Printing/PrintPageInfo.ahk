#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintPageInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Stores formatting data for a single section of printable pages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpageinfo
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintPageInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintPageInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintPageInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the media size option of the given print section.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpageinfo.mediasize
     * @type {Integer} 
     */
    MediaSize {
        get => this.get_MediaSize()
        set => this.put_MediaSize(value)
    }

    /**
     * Gets or sets the intended paper size on which to print the given section.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpageinfo.pagesize
     * @type {SIZE} 
     */
    PageSize {
        get => this.get_PageSize()
        set => this.put_PageSize(value)
    }

    /**
     * Gets the print resolution on the horizontal axis for the given print section.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpageinfo.dpix
     * @type {Integer} 
     */
    DpiX {
        get => this.get_DpiX()
        set => this.put_DpiX(value)
    }

    /**
     * Gets the print resolution on the vertical axis for the given print section.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpageinfo.dpiy
     * @type {Integer} 
     */
    DpiY {
        get => this.get_DpiY()
        set => this.put_DpiY(value)
    }

    /**
     * Gets or sets the orientation option for the given print section.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpageinfo.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes an instance of the [PrintPageInfo](printpageinfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintPageInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MediaSize(value) {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.put_MediaSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaSize() {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.get_MediaSize()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_PageSize(value) {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.put_PageSize(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PageSize() {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.get_PageSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DpiX(value) {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.put_DpiX(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DpiX() {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.get_DpiX()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DpiY(value) {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.put_DpiY(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DpiY() {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.get_DpiY()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.put_Orientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IPrintPageInfo")) {
            if ((queryResult := this.QueryInterface(IPrintPageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintPageInfo := IPrintPageInfo(outPtr)
        }

        return this.__IPrintPageInfo.get_Orientation()
    }

;@endregion Instance Methods
}
