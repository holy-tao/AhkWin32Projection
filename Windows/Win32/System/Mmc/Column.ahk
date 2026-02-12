#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Column Name Limitations
 * @see https://learn.microsoft.com/sql/ocs/docs/odbc/microsoft/column-name-limitations
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Column extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Column
     * @type {Guid}
     */
    static IID => Guid("{fd1c5f63-2b16-4d06-9ab3-f45350b940ab}")

    /**
     * The class identifier for Column
     * @type {Guid}
     */
    static CLSID => Guid("{fd1c5f63-2b16-4d06-9ab3-f45350b940ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Name", "get_Width", "put_Width", "get_DisplayPosition", "put_DisplayPosition", "get_Hidden", "put_Hidden", "SetAsSortColumn", "IsSortColumn"]

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Integer} 
     */
    DisplayPosition {
        get => this.get_DisplayPosition()
        set => this.put_DisplayPosition(value)
    }

    /**
     * @type {BOOL} 
     */
    Hidden {
        get => this.get_Hidden()
        set => this.put_Hidden(value)
    }

    /**
     * Name Property (SecurityCertificate Class)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/securitycertificate-class/name-property-securitycertificate-class
     */
    Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Name
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(8, this, "int*", &Width := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Width
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     */
    put_Width(Width) {
        result := ComCall(9, this, "int", Width, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayPosition() {
        result := ComCall(10, this, "int*", &DisplayPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayPosition
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    put_DisplayPosition(Index) {
        result := ComCall(11, this, "int", Index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Hidden() {
        result := ComCall(12, this, "int*", &Hidden := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Hidden
    }

    /**
     * 
     * @param {BOOL} Hidden 
     * @returns {HRESULT} 
     */
    put_Hidden(Hidden) {
        result := ComCall(13, this, "int", Hidden, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} SortOrder 
     * @returns {HRESULT} 
     */
    SetAsSortColumn(SortOrder) {
        result := ComCall(14, this, "int", SortOrder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSortColumn() {
        result := ComCall(15, this, "int*", &IsSortColumn := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IsSortColumn
    }
}
