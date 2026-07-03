#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) data broadcast descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbdatabroadcastdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbDataBroadcastDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbDataBroadcastDescriptor
     * @type {Guid}
     */
    static IID := Guid("{d1ebc1d6-8b60-4c20-9caf-e59382e7c400}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbDataBroadcastDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag             : IntPtr
        GetLength          : IntPtr
        GetDataBroadcastID : IntPtr
        GetComponentTag    : IntPtr
        GetSelectorLength  : IntPtr
        GetSelectorBytes   : IntPtr
        GetLangID          : IntPtr
        GetTextLength      : IntPtr
        GetText            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbDataBroadcastDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @returns {Integer} Receives the descriptor tag. For data broadcast descriptors, this value is 0x64.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of a Digital Video Broadcast (DVB) data broadcast descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier that identifies the network broadcast from a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @returns {Integer} Receives the broadcaster ID.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getdatabroadcastid
     */
    GetDataBroadcastID() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the component tag from a Digital Video Broadcast (DVB) data broadcast descriptor. The component tag identifies a component stream within the service.
     * @returns {Integer} Receives the component tag.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the selector in a DVB data broadcast descriptor, in bytes. The selector is defined by the data broadcast specification for the network.
     * @returns {Integer} Receives the selector length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getselectorlength
     */
    GetSelectorLength() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the data from the selector in a Digital Video Broadcast (DVB) data broadcast descriptor. The selector is defined by the broadcast standard for the network.
     * @param {Pointer<Integer>} pbLen On input, specifies the size of the buffer (pointed to by the <i>pbVal</i> parameter) allocated for the selector data, in bytes. On output, gets the actual length of the selector data.
     * @returns {Integer} Receives the selector bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getselectorbytes
     */
    GetSelectorBytes(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbLenMarshal, pbLen, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) data broadcast descriptor. This language code identifies the language used for the text description field.
     * @returns {Integer} Receives the language code. For a list of language codes, refer to the <a href="http://www-01.sil.org/iso639-3/codes.asp">ISO 639 Code Tables</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getlangid
     */
    GetLangID() {
        result := ComCall(9, this, "uint*", &pulVal := 0, "HRESULT")
        return pulVal
    }

    /**
     * Gets length of the text description, in bytes, from a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @returns {Integer} Receives the text description length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettextlength
     */
    GetTextLength() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the text that describes the data from a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @param {Pointer<Integer>} pbLen Specifies or receives the length of the
     * description, in bytes.
     * @returns {Integer} Receives the description text.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettext
     */
    GetText(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, pbLenMarshal, pbLen, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    Query(iid) {
        if (IDvbDataBroadcastDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetDataBroadcastID := CallbackCreate(GetMethod(implObj, "GetDataBroadcastID"), flags, 2)
        this.vtbl.GetComponentTag := CallbackCreate(GetMethod(implObj, "GetComponentTag"), flags, 2)
        this.vtbl.GetSelectorLength := CallbackCreate(GetMethod(implObj, "GetSelectorLength"), flags, 2)
        this.vtbl.GetSelectorBytes := CallbackCreate(GetMethod(implObj, "GetSelectorBytes"), flags, 3)
        this.vtbl.GetLangID := CallbackCreate(GetMethod(implObj, "GetLangID"), flags, 2)
        this.vtbl.GetTextLength := CallbackCreate(GetMethod(implObj, "GetTextLength"), flags, 2)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetDataBroadcastID)
        CallbackFree(this.vtbl.GetComponentTag)
        CallbackFree(this.vtbl.GetSelectorLength)
        CallbackFree(this.vtbl.GetSelectorBytes)
        CallbackFree(this.vtbl.GetLangID)
        CallbackFree(this.vtbl.GetTextLength)
        CallbackFree(this.vtbl.GetText)
    }
}
