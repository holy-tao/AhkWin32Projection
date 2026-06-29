#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method for manually copying a stream or file before applying changes to properties.
 * @remarks
 * The default copy-on-write behavior provided by <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> causes the entire source stream to be duplicated during a write operation. This can be costly for large streams, especially when a large portion of the stream is to be changed. <b>IDestinationStreamFactory</b> provides an alternative for the property handler author, who can use it manually to ensure that property changes do not corrupt the stream in case of failure. To do this, the author marks the handler as NoTransactedMode in the handler's CoClass registry key, and queries the stream for this interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idestinationstreamfactory
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDestinationStreamFactory extends IUnknown {
    /**
     * The interface identifier for IDestinationStreamFactory
     * @type {Guid}
     */
    static IID := Guid("{8a87781b-39a7-4a1f-aab3-a39b9c34a7d9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDestinationStreamFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDestinationStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDestinationStreamFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an empty stream that receives the new version of the file being copied.
     * @remarks
     * The property handler author calls <b>IDestinationStreamFactory::GetDestinationStream</b> to get a new empty stream that the new version of the file will write to. The handler builds the destination stream manually, copying from the source stream as necessary.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address of a pointer to the new stream.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idestinationstreamfactory-getdestinationstream
     */
    GetDestinationStream() {
        result := ComCall(3, this, "ptr*", &ppstm := 0, "HRESULT")
        return IStream(ppstm)
    }

    Query(iid) {
        if (IDestinationStreamFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDestinationStream := CallbackCreate(GetMethod(implObj, "GetDestinationStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDestinationStream)
    }
}
