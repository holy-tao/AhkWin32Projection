#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAVIStream.ahk" { IAVIStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\AVISTREAMINFOW.ahk" { AVISTREAMINFOW }

/**
 * The IAVIFile interface supports opening and manipulating files and file headers, and creating and obtaining stream interfaces. Uses IUnknown::QueryInterface, IUnknown::AddRef, and IUnknown::Release in addition to the following custom methods:\_
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nn-vfw-iavifile
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct IAVIFile extends IUnknown {
    /**
     * The interface identifier for IAVIFile
     * @type {Guid}
     */
    static IID := Guid("{00020020-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAVIFile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Info         : IntPtr
        GetStream    : IntPtr
        CreateStream : IntPtr
        WriteData    : IntPtr
        ReadData     : IntPtr
        EndRecord    : IntPtr
        DeleteStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAVIFile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Info method returns with information about an AVI file. Called when an application uses the AVIFileInfo function.
     * @remarks
     * If the buffer allocated is too small for the structure, this method should fail the call by returning AVIERR_BUFFERTOOSMALL. Otherwise, it should fill the structure and return its size.
     * 
     * For handlers written in C++, <b>Info</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Info(AVIFILEINFO *pfi, LONG lSize) 
     *  
     * 
     * ```
     * @param {Integer} pfi A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avifileinfoa">AVIFILEINFO</a> structure. The method fills the structure with information about the file.
     * @param {Integer} lSize The size, in bytes, of the buffer specified by <i>pfi</i>.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-info
     */
    Info(pfi, lSize) {
        result := ComCall(3, this, "ptr", pfi, "int", lSize, "HRESULT")
        return result
    }

    /**
     * The GetStream method opens a stream by accessing it in a file. Called when an application uses the AVIFileGetStream function.
     * @remarks
     * It is typically easier to implement this method by creating all of the stream objects in advance by using the <a href="https://docs.microsoft.com/previous-versions/dd798007(v=vs.85)">IAVIFile::Open</a> method. Then, this method accesses the interface to the specified stream.
     * 
     * Remember to increment the reference count maintained by the <b>AddRef</b> method for the stream when this method is used.
     * 
     * For handlers written in C++, GetStream has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT GetStream(PAVISTREAM *ppStream, 
     *     DWORD fccType, LONG lParam); 
     *  
     * 
     * ```
     * @param {Integer} fccType Four-character code indicating the type of stream to locate.
     * @param {Integer} _lParam Stream number.
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to a stream.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-getstream
     */
    GetStream(fccType, _lParam) {
        result := ComCall(4, this, "ptr*", &ppStream := 0, "uint", fccType, "int", _lParam, "HRESULT")
        return IAVIStream(ppStream)
    }

    /**
     * The CreateStream method creates a stream for writing. Called when an application uses the AVIFileCreateStream function.
     * @remarks
     * For handlers written in C++, <b>CreateStream</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT CreateStream(PAVISTREAM *ppstream, 
     *     AVISTREAMINFO *psi); 
     *  
     * 
     * ```
     * @param {Pointer<AVISTREAMINFOW>} psi Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure defining the stream to create.
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to the new stream.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-createstream
     */
    CreateStream(psi) {
        result := ComCall(5, this, "ptr*", &ppStream := 0, AVISTREAMINFOW.Ptr, psi, "HRESULT")
        return IAVIStream(ppStream)
    }

    /**
     * The WriteData method writes file headers. Called when an application uses the AVIFileWriteData function.
     * @remarks
     * For handlers written in C++, <b>WriteData</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT WriteData(DWORD fcc, LPVOID lpBuffer, LONG cbBuffer); 
     *  
     * 
     * ```
     * @param {Integer} ckid A chunk ID.
     * @param {Integer} lpData A pointer specifying the memory from which the data is written.
     * @param {Integer} cbData A LONG specifying the number of bytes to write.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-writedata
     */
    WriteData(ckid, lpData, cbData) {
        result := ComCall(6, this, "uint", ckid, "ptr", lpData, "int", cbData, "HRESULT")
        return result
    }

    /**
     * The ReadData method reads file headers. Called when an application uses the AVIFileReadData function.
     * @remarks
     * For handlers written in C++, <b>ReadData</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT ReadData(DWORD fcc, LPVOID lp, LONG *lpcb); 
     *  
     * 
     * ```
     * @param {Integer} ckid A chunk identifier.
     * @param {Integer} lpData A pointer specifying the memory into which the data is read.
     * @param {Pointer<Integer>} lpcbData A pointer to a LONG specifying the number of bytes read.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-readdata
     */
    ReadData(ckid, lpData, lpcbData) {
        lpcbDataMarshal := lpcbData is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", ckid, "ptr", lpData, lpcbDataMarshal, lpcbData, "HRESULT")
        return result
    }

    /**
     * The EndRecord method writes the &quot;REC&quot; chunk in a tightly interleaved AVI file (having a one-to-one interleave factor of audio to video). Called when an application uses the AVIFileEndRecord function.
     * @remarks
     * This file handler method is typically not used.
     * 
     * For handlers written in C++, <b>EndRecord</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT EndRecord(VOID); 
     *  
     * 
     * ```
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-endrecord
     */
    EndRecord() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fccType 
     * @param {Integer} _lParam 
     * @returns {HRESULT} 
     */
    DeleteStream(fccType, _lParam) {
        result := ComCall(9, this, "uint", fccType, "int", _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAVIFile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Info := CallbackCreate(GetMethod(implObj, "Info"), flags, 3)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 4)
        this.vtbl.CreateStream := CallbackCreate(GetMethod(implObj, "CreateStream"), flags, 3)
        this.vtbl.WriteData := CallbackCreate(GetMethod(implObj, "WriteData"), flags, 4)
        this.vtbl.ReadData := CallbackCreate(GetMethod(implObj, "ReadData"), flags, 4)
        this.vtbl.EndRecord := CallbackCreate(GetMethod(implObj, "EndRecord"), flags, 1)
        this.vtbl.DeleteStream := CallbackCreate(GetMethod(implObj, "DeleteStream"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Info)
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.CreateStream)
        CallbackFree(this.vtbl.WriteData)
        CallbackFree(this.vtbl.ReadData)
        CallbackFree(this.vtbl.EndRecord)
        CallbackFree(this.vtbl.DeleteStream)
    }
}
