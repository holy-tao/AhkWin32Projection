#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TERMINAL_DIRECTION.ahk" { TERMINAL_DIRECTION }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IEnumTerminalClass.ahk" { IEnumTerminalClass }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTerminal.ahk" { IEnumTerminal }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITTerminalSupport interface is exposed on an Address object only if an MSP exists. The methods of this interface allow an application to discover available terminals and/or create one, and get pointers to required Terminal objects.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itterminalsupport
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTerminalSupport extends IDispatch {
    /**
     * The interface identifier for ITTerminalSupport
     * @type {Guid}
     */
    static IID := Guid("{b1efc385-9355-11d0-835c-00aa003ccabd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTerminalSupport interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StaticTerminals             : IntPtr
        EnumerateStaticTerminals        : IntPtr
        get_DynamicTerminalClasses      : IntPtr
        EnumerateDynamicTerminalClasses : IntPtr
        CreateTerminal                  : IntPtr
        GetDefaultStaticTerminal        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTerminalSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    StaticTerminals {
        get => this.get_StaticTerminals()
    }

    /**
     * @type {VARIANT} 
     */
    DynamicTerminalClasses {
        get => this.get_DynamicTerminalClasses()
    }

    /**
     * The get_StaticTerminals method creates a collection of currently available static terminals.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITTerminalSupport::get_StaticTerminals</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b>, which TAPI will fill in with an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals
     */
    get_StaticTerminals() {
        pVariant := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateStaticTerminals method enumerates the currently available static terminals associated with the address.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface returned by <b>ITTerminalSupport::EnumerateStaticTerminals</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumTerminal</b> interface to free resources associated with it.
     * @returns {IEnumTerminal} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals
     */
    EnumerateStaticTerminals() {
        result := ComCall(8, this, "ptr*", &ppTerminalEnumerator := 0, "HRESULT")
        return IEnumTerminal(ppTerminalEnumerator)
    }

    /**
     * The get_DynamicTerminalClasses method creates a collection of currently available dynamic terminals.
     * @remarks
     * An application calls this method to find out which dynamic terminal classes are supported by this address in a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-createterminal">ITTerminalSupport::CreateTerminal</a>.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">terminal classes</a> in a string (<b>BSTR</b>) format.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-get_dynamicterminalclasses
     */
    get_DynamicTerminalClasses() {
        pVariant := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDynamicTerminalClasses method enumerates the currently available dynamic terminal classes that are supported.
     * @remarks
     * An application calls this method to find out which dynamic terminal classes are supported by this address in a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-createterminal">ITTerminalSupport::CreateTerminal</a>.
     * 
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminalclass">IEnumTerminalClass</a> interface returned by <b>ITTerminalSupport::EnumerateDynamicTerminalClasses</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumTerminalClass</b> interface to free resources associated with it.
     * @returns {IEnumTerminalClass} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminalclass">IEnumTerminalClass</a> enumerator. TAPI returns these classes as GUIDs.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratedynamicterminalclasses
     */
    EnumerateDynamicTerminalClasses() {
        result := ComCall(10, this, "ptr*", &ppTerminalClassEnumerator := 0, "HRESULT")
        return IEnumTerminalClass(ppTerminalClassEnumerator)
    }

    /**
     * The CreateTerminal method creates and initializes a new ITTerminal object based on the dynamic terminal class and media. The terminal class is identified by a GUID. The GUID must be converted to a string using StringFromIID to pass to this method.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pTerminalClass</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * Once a terminal is created, it can be selected onto only one call.
     * 
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <b>ITTerminal</b> interface returned by <b>ITTerminalSupport::CreateTerminal</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @param {BSTR} pTerminalClass Pointer to <b>BSTR</b> containing the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">terminal class</a> (GUID) for the new terminal object.
     * @param {Integer} lMediaType Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a> for the new terminal object.
     * @param {TERMINAL_DIRECTION} _Direction <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor of the terminal direction.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> object created.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-createterminal
     */
    CreateTerminal(pTerminalClass, lMediaType, _Direction) {
        pTerminalClass := pTerminalClass is String ? BSTR.Alloc(pTerminalClass).Value : pTerminalClass

        result := ComCall(11, this, BSTR, pTerminalClass, "int", lMediaType, TERMINAL_DIRECTION, _Direction, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The GetDefaultStaticTerminal method gets the default static terminal for the media type specified.
     * @remarks
     * This method does not return dynamic terminals. For example, having a media type of TAPIMEDIATYPE_VIDEO and a terminal direction of TD_RENDER defines a dynamic terminal; this method will fail with those parameters.
     * 
     * The default static terminal returned by this method is one of the static terminals returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals">ITTerminalSupport::EnumerateStaticTerminals</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals">ITTerminalSupport::get_StaticTerminals</a>. Usually, the default terminal is the one selected as "preferred device" in Control Panel's "Sounds and Multimedia Properties" applet.
     * 
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITTerminalSupport::GetDefaultStaticTerminal</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITTerminal</b> interface to free resources associated with it.
     * @param {Integer} lMediaType <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">Media type</a> of the required terminal.
     * @param {TERMINAL_DIRECTION} _Direction <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor of the terminal direction.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface. <b>NULL</b> if no terminal is available.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-getdefaultstaticterminal
     */
    GetDefaultStaticTerminal(lMediaType, _Direction) {
        result := ComCall(12, this, "int", lMediaType, TERMINAL_DIRECTION, _Direction, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    Query(iid) {
        if (ITTerminalSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StaticTerminals := CallbackCreate(GetMethod(implObj, "get_StaticTerminals"), flags, 2)
        this.vtbl.EnumerateStaticTerminals := CallbackCreate(GetMethod(implObj, "EnumerateStaticTerminals"), flags, 2)
        this.vtbl.get_DynamicTerminalClasses := CallbackCreate(GetMethod(implObj, "get_DynamicTerminalClasses"), flags, 2)
        this.vtbl.EnumerateDynamicTerminalClasses := CallbackCreate(GetMethod(implObj, "EnumerateDynamicTerminalClasses"), flags, 2)
        this.vtbl.CreateTerminal := CallbackCreate(GetMethod(implObj, "CreateTerminal"), flags, 5)
        this.vtbl.GetDefaultStaticTerminal := CallbackCreate(GetMethod(implObj, "GetDefaultStaticTerminal"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StaticTerminals)
        CallbackFree(this.vtbl.EnumerateStaticTerminals)
        CallbackFree(this.vtbl.get_DynamicTerminalClasses)
        CallbackFree(this.vtbl.EnumerateDynamicTerminalClasses)
        CallbackFree(this.vtbl.CreateTerminal)
        CallbackFree(this.vtbl.GetDefaultStaticTerminal)
    }
}
