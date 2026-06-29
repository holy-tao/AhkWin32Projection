#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TERMINAL_DIRECTION.ahk" { TERMINAL_DIRECTION }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITPluggableTerminalClassInfo interface exposes methods that allow the application to retrieve information concerning a pluggable terminal.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itpluggableterminalclassinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITPluggableTerminalClassInfo extends IDispatch {
    /**
     * The interface identifier for ITPluggableTerminalClassInfo
     * @type {Guid}
     */
    static IID := Guid("{41757f4a-cf09-4b34-bc96-0a79d2390076}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITPluggableTerminalClassInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name          : IntPtr
        get_Company       : IntPtr
        get_Version       : IntPtr
        get_TerminalClass : IntPtr
        get_CLSID         : IntPtr
        get_Direction     : IntPtr
        get_MediaTypes    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITPluggableTerminalClassInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Company {
        get => this.get_Company()
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {BSTR} 
     */
    TerminalClass {
        get => this.get_TerminalClass()
    }

    /**
     * @type {BSTR} 
     */
    CLSID {
        get => this.get_CLSID()
    }

    /**
     * @type {TERMINAL_DIRECTION} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * @type {Integer} 
     */
    MediaTypes {
        get => this.get_MediaTypes()
    }

    /**
     * The get_Name method gets the terminal's friendly name. (ITPluggableTerminalClassInfo.get_Name)
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal's friendly name. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_name
     */
    get_Name() {
        pName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * The get_Company method gets the name of the company that issued this pluggable terminal. (ITPluggableTerminalClassInfo.get_Company)
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal's company name. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_company
     */
    get_Company() {
        pCompany := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pCompany, "HRESULT")
        return pCompany
    }

    /**
     * The get_Version method gets the terminal version. (ITPluggableTerminalClassInfo.get_Version)
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal version. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_version
     */
    get_Version() {
        pVersion := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVersion, "HRESULT")
        return pVersion
    }

    /**
     * The get_TerminalClass method gets the terminal's terminal class. (ITPluggableTerminalClassInfo.get_TerminalClass)
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal's 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">terminal class</a>. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. It should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_terminalclass
     */
    get_TerminalClass() {
        pTerminalClass := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pTerminalClass, "HRESULT")
        return pTerminalClass
    }

    /**
     * The get_CLSID method gets the CLSID used to CoCreateInstance the terminal. (ITPluggableTerminalClassInfo.get_CLSID)
     * @returns {BSTR} The <b>BSTR</b> representation of the CLSID. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_clsid
     */
    get_CLSID() {
        pCLSID := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pCLSID, "HRESULT")
        return pCLSID
    }

    /**
     * The get_Direction method gets the direction supported by the terminal. (ITPluggableTerminalClassInfo.get_Direction)
     * @returns {TERMINAL_DIRECTION} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor for the direction supported by the terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_direction
     */
    get_Direction() {
        result := ComCall(12, this, "int*", &pDirection := 0, "HRESULT")
        return pDirection
    }

    /**
     * The get_MediaTypes method gets the media types supported by the terminal. (ITPluggableTerminalClassInfo.get_MediaTypes)
     * @returns {Integer} Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> supported by the terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_mediatypes
     */
    get_MediaTypes() {
        result := ComCall(13, this, "int*", &pMediaTypes := 0, "HRESULT")
        return pMediaTypes
    }

    Query(iid) {
        if (ITPluggableTerminalClassInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Company := CallbackCreate(GetMethod(implObj, "get_Company"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.get_TerminalClass := CallbackCreate(GetMethod(implObj, "get_TerminalClass"), flags, 2)
        this.vtbl.get_CLSID := CallbackCreate(GetMethod(implObj, "get_CLSID"), flags, 2)
        this.vtbl.get_Direction := CallbackCreate(GetMethod(implObj, "get_Direction"), flags, 2)
        this.vtbl.get_MediaTypes := CallbackCreate(GetMethod(implObj, "get_MediaTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Company)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.get_TerminalClass)
        CallbackFree(this.vtbl.get_CLSID)
        CallbackFree(this.vtbl.get_Direction)
        CallbackFree(this.vtbl.get_MediaTypes)
    }
}
