#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IStdMarshalInfo (objidlbase.h) interface retrieves the CLSID identifying the handler to be used in the destination process during standard marshaling.
 * @remarks
 * An object that uses OLE's default implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> does not provide its own proxy but, by implementing <b>IStdMarshalInfo</b>, can nevertheless specify a handler to be loaded in the client process. Such a handler would typically handle certain requests in-process and use OLE's default marshaling to delegate others back to the original object.
 * 
 * To create an instance of an object in some client process, COM must first determine whether the object uses default marshaling or its own implementation. If the object uses default marshaling, COM then queries the object to determine whether it uses a special handler or, simply, OLE's default proxy. To get the CLSID of the handler to be loaded, COM queries the object for <b>IStdMarshalInfo</b> and then the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a> interface. If neither interface is supported, a standard handler is used.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-istdmarshalinfo
 * @namespace Windows.Win32.System.Com
 */
export default struct IStdMarshalInfo extends IUnknown {
    /**
     * The interface identifier for IStdMarshalInfo
     * @type {Guid}
     */
    static IID := Guid("{00000018-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStdMarshalInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClassForHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStdMarshalInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IStdMarshalInfo::GetClassForHandler (objidlbase.h) method retrieves the CLSID of the object handler to be used in the destination process during standard marshaling.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation of <b>IStdMarshalInfo::GetClassForHandler</b> must return your own CLSID. This enables an object to be created by a different server.
     * @param {Integer} dwDestContext The destination context, that is, the process in which the unmarshaling will be done. Possible values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>.
     * @returns {Guid} A pointer to the handler's CLSID.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-istdmarshalinfo-getclassforhandler
     */
    GetClassForHandler(dwDestContext) {
        static pvDestContext := 0 ;Reserved parameters must always be NULL

        pClsid := Guid()
        result := ComCall(3, this, "uint", dwDestContext, "ptr", pvDestContext, Guid.Ptr, pClsid, "HRESULT")
        return pClsid
    }

    Query(iid) {
        if (IStdMarshalInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClassForHandler := CallbackCreate(GetMethod(implObj, "GetClassForHandler"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClassForHandler)
    }
}
