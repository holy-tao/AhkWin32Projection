#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAVIStream.ahk" { IAVIStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAVIEditStream interface supports manipulating and modifying editable streams. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nn-vfw-iavieditstream
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct IAVIEditStream extends IUnknown {
    /**
     * The interface identifier for IAVIEditStream
     * @type {Guid}
     */
    static IID := Guid("{00020024-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAVIEditStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cut     : IntPtr
        Copy    : IntPtr
        Paste   : IntPtr
        Clone   : IntPtr
        SetInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAVIEditStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Cut method removes a portion of a stream and places it in a temporary stream. Called when an application uses the EditStreamCut function.
     * @remarks
     * For handlers written in C++, <b>Cut</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Cut(LONG *plStart, LONG *plLength, 
     *     PAVISTREAM *ppResult); 
     *  
     * 
     * ```
     * @param {Pointer<Integer>} plStart Pointer to a buffer that receives the starting position of the operation.
     * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the length, in frames, of the operation.
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to the new stream.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-cut
     */
    Cut(plStart, plLength) {
        plStartMarshal := plStart is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", &ppResult := 0, "HRESULT")
        return IAVIStream(ppResult)
    }

    /**
     * The Copy method copies a stream or a portion of it to a temporary stream. Called when an application uses the EditStreamCopy function.
     * @remarks
     * For handlers written in C++, <b>Copy</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Copy(LONG *plStart, LONG *plLength, 
     *     PAVISTREAM * ppResult); 
     *  
     * 
     * ```
     * @param {Pointer<Integer>} plStart Pointer to a buffer that receives the starting position of the operation.
     * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the length, in frames, of the operation.
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to the new stream.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-copy
     */
    Copy(plStart, plLength) {
        plStartMarshal := plStart is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", &ppResult := 0, "HRESULT")
        return IAVIStream(ppResult)
    }

    /**
     * The Paste method copies a stream or a portion of it in another stream. Called when an application uses the EditStreamPaste function.
     * @remarks
     * For handlers written in C++, <b>Paste</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Paste(LONG *plPos, LONG *plLength, 
     *     PAVISTREAM pstream, LONG lStart, LONG lLength); 
     *  
     * 
     * ```
     * @param {Pointer<Integer>} plPos Pointer to a buffer that receives the starting position of the operation.
     * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the length, in bytes, of the data to paste from the source stream.
     * @param {IAVIStream} pstream Pointer to the interface to the source stream.
     * @param {Integer} lStart Starting position of the copy operation within the source stream.
     * @param {Integer} lEnd Ending position of the copy operation within the source stream.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-paste
     */
    Paste(plPos, plLength, pstream, lStart, lEnd) {
        plPosMarshal := plPos is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plPosMarshal, plPos, plLengthMarshal, plLength, "ptr", pstream, "int", lStart, "int", lEnd, "HRESULT")
        return result
    }

    /**
     * The Clone method duplicates a stream. Called when an application uses the EditStreamClone function.
     * @remarks
     * For handlers written in C++, <b>Clone</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Clone(PAVISTREAM *ppResult); 
     *  
     * 
     * ```
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to the new stream.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppResult := 0, "HRESULT")
        return IAVIStream(ppResult)
    }

    /**
     * The SetInfo method changes the characteristics of a stream. Called when an application uses the EditStreamSetInfo function.
     * @remarks
     * For handlers written in C++, <b>SetInfo</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT SetInfo(AVISTREAMINFO *lpInfo, LONG cbInfo); 
     *  
     * 
     * ```
     * @param {Integer} lpInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure containing the new stream characteristics.
     * @param {Integer} cbInfo Size, in bytes, of the buffer.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-setinfo
     */
    SetInfo(lpInfo, cbInfo) {
        result := ComCall(7, this, "ptr", lpInfo, "int", cbInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAVIEditStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cut := CallbackCreate(GetMethod(implObj, "Cut"), flags, 4)
        this.vtbl.Copy := CallbackCreate(GetMethod(implObj, "Copy"), flags, 4)
        this.vtbl.Paste := CallbackCreate(GetMethod(implObj, "Paste"), flags, 6)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.SetInfo := CallbackCreate(GetMethod(implObj, "SetInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cut)
        CallbackFree(this.vtbl.Copy)
        CallbackFree(this.vtbl.Paste)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.SetInfo)
    }
}
