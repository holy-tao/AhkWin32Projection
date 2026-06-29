#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAVIStream interface supports creating and manipulating data streams within a file. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nn-vfw-iavistream
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct IAVIStream extends IUnknown {
    /**
     * The interface identifier for IAVIStream
     * @type {Guid}
     */
    static IID := Guid("{00020021-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAVIStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create     : IntPtr
        Info       : IntPtr
        FindSample : IntPtr
        ReadFormat : IntPtr
        SetFormat  : IntPtr
        Read       : IntPtr
        Write      : IntPtr
        Delete     : IntPtr
        ReadData   : IntPtr
        WriteData  : IntPtr
        SetInfo    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAVIStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create method initializes a stream handler that is not associated with any file. Called when an application uses the AVIStreamCreate function.
     * @remarks
     * For handlers written in C++, <b>Create</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Create(LONG lParam1, LONG lParam2) 
     *  
     * 
     * ```
     * @param {LPARAM} lParam1 Stream handler-specific data.
     * @param {LPARAM} lParam2 Stream handler-specific data.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-create
     */
    Create(lParam1, lParam2) {
        result := ComCall(3, this, LPARAM, lParam1, LPARAM, lParam2, "HRESULT")
        return result
    }

    /**
     * The Info method fills and returns an AVISTREAMINFO structure with information about a stream. Called when an application uses the AVIStreamInfo function.
     * @remarks
     * If the buffer allocated is too small for the structure, the <b>Info</b> method should fail the call by returning AVIERR_BUFFERTOOSMALL. Otherwise, it should fill the structure and return its size.
     * 
     * For handlers written in C++, <b>Info</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Info(AVIFILEINFO *psi, LONG lSize) 
     *  
     * 
     * ```
     * @param {Integer} psi Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure to contain stream information.
     * @param {Integer} lSize Size, in bytes, of the structure specified by <i>psi</i>.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-info
     */
    Info(psi, lSize) {
        result := ComCall(4, this, "ptr", psi, "int", lSize, "HRESULT")
        return result
    }

    /**
     * The FindSample method obtains the position in a stream of a key frame or a nonempty frame. Called when an application uses the AVIStreamFindSample function.
     * @remarks
     * If key frames are not significant in your custom format, return the position specified for <i>lPos</i>.
     * 
     * For handlers written in C++, <b>FindSample</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * LONG FindSample(LONG lPos, LONG lFlags) 
     *  
     * 
     * ```
     * @param {Integer} lPos Position of the sample or frame.
     * @param {Integer} lFlags Applicable flags. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>FIND_ANY</td>
     * <td>Searches for a nonempty frame.</td>
     * </tr>
     * <tr>
     * <td>FIND_FORMAT</td>
     * <td>Searches for a format change.</td>
     * </tr>
     * <tr>
     * <td>FIND_KEY</td>
     * <td>Searches for a key frame.</td>
     * </tr>
     * <tr>
     * <td>FIND_NEXT</td>
     * <td>Searches forward through a stream, beginning with the current frame.</td>
     * </tr>
     * <tr>
     * <td>FIND_PREV</td>
     * <td>Searches backward through a stream, beginning with the current frame.</td>
     * </tr>
     * </table>
     *  
     * 
     * The FIND_ANY, FIND_KEY, and FIND_FORMAT flags are mutually exclusive, as are the FIND_NEXT and FIND_PREV flags. You must specify one value from each group.
     * @returns {Integer} Returns the location of the key frame corresponding to the frame specified by the application.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-findsample
     */
    FindSample(lPos, lFlags) {
        result := ComCall(5, this, "int", lPos, "int", lFlags, Int32)
        return result
    }

    /**
     * The ReadFormat method obtains format information from a stream.
     * @remarks
     * The type of data stored in a stream dictates the format information and the structure that contains the format information. A stream handler should return all applicable format information in this structure, including palette information when the format uses a palette. A stream handler should not return stream data with the structure.
     * 
     * Standard video stream handlers provide format information in a <b>BITMAPINFOHEADER</b> structure. Standard audio stream handlers provide format information in a <b>PCMWAVEFORMAT</b> structure. Other data streams can use other structures that describe the stream data.
     * 
     * For handlers written in C++, <b>ReadFormat</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT ReadFormat(LONG lPos, LPVOID lpFormat, 
     *     LONG *lpcbFormat) 
     *  
     * 
     * ```
     * @param {Integer} lPos Position of the sample or frame.
     * @param {Integer} lpFormat Pointer to the buffer for the format data. Specify <b>NULL</b> to request the required size of the buffer.
     * @param {Pointer<Integer>} lpcbFormat Pointer to a buffer that receives the size, in bytes, of the buffer specified by <i>lpFormat</i>. When this method is called, the contents of this parameter indicates the size of the buffer specified by <i>lpFormat</i>. When this method returns control to the application, the contents of this parameter specifies the amount of data read or the required size of the buffer.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-readformat
     */
    ReadFormat(lPos, lpFormat, lpcbFormat) {
        lpcbFormatMarshal := lpcbFormat is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", lPos, "ptr", lpFormat, lpcbFormatMarshal, lpcbFormat, "HRESULT")
        return result
    }

    /**
     * The SetFormat method sets format information in a stream. Called when an application uses the AVIStreamSetFormat function.
     * @remarks
     * Standard video stream handlers provide format information in a <b>BITMAPINFOHEADER</b> structure. Standard audio stream handlers provide format information in a <b>PCMWAVEFORMAT</b> structure. Other data streams can use other structures that describe the stream data.
     * 
     * For handlers written in C++, <b>SetFormat</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT SetFormat(LONG lPos, LPVOID lpFormat, LONG cbFormat) 
     *  
     * 
     * ```
     * @param {Integer} lPos Pointer to the interface to a stream.
     * @param {Integer} lpFormat Pointer to the buffer for the format data.
     * @param {Integer} cbFormat Address containing the size, in bytes, of the buffer specified by <i>lpFormat</i>.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-setformat
     */
    SetFormat(lPos, lpFormat, cbFormat) {
        result := ComCall(7, this, "int", lPos, "ptr", lpFormat, "int", cbFormat, "HRESULT")
        return result
    }

    /**
     * The Read method reads data from a stream and copies it to an application-defined buffer. If no buffer is supplied, it determines the buffer size needed to retrieve the next buffer of data. Called when an application uses the AVIStreamRead function.
     * @remarks
     * For handlers written in C++, <b>Read</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Read(LONG lStart, LONG lSamples, 
     *     LPVOID lpBuffer, LONG cbBuffer, 
     *     LONG *plBytes, LONG *plSamples); 
     *  
     * 
     * ```
     * @param {Integer} lStart Starting sample or frame number to read.
     * @param {Integer} lSamples Number of samples to read.
     * @param {Integer} lpBuffer Pointer to the application-defined buffer to contain the stream data. You can also specify <b>NULL</b> to request the required size of the buffer. Many applications precede each read operation with a query for the buffer size to see how large a buffer is needed.
     * @param {Integer} cbBuffer Size, in bytes, of the buffer specified by <i>lpBuffer</i>.
     * @param {Pointer<Integer>} plBytes Pointer to a buffer that receives the number of bytes read.
     * @param {Pointer<Integer>} plSamples Pointer to a buffer that receives the number of samples read.
     * @returns {HRESULT} Returns AVIERR_OK if successful or AVIERR_BUFFERTOOSMALL if the buffer is not large enough to hold the data. If successful, <b>Read</b> also returns either a buffer of data with the number of frames (samples) included in the buffer or the required buffer size, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-read
     */
    Read(lStart, lSamples, lpBuffer, cbBuffer, plBytes, plSamples) {
        plBytesMarshal := plBytes is VarRef ? "int*" : "ptr"
        plSamplesMarshal := plSamples is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, plBytesMarshal, plBytes, plSamplesMarshal, plSamples, "HRESULT")
        return result
    }

    /**
     * The Write method writes data to a stream. Called when an application uses the AVIStreamWrite function.
     * @remarks
     * For handlers written in C++, <b>Write</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Write(LONG lStart, LONG lSamples, LPVOID lpBuffer, 
     *     LONG cbBuffer, DWORD dwFlags, LONG *plSampWritten, 
     *     LONG *plBytesWritten); 
     *  
     * 
     * ```
     * @param {Integer} lStart Starting sample or frame number to write.
     * @param {Integer} lSamples Number of samples to write.
     * @param {Integer} lpBuffer Pointer to the buffer for the data.
     * @param {Integer} cbBuffer Size, in bytes, of the buffer specified by <i>lpBuffer</i>.
     * @param {Integer} dwFlags Applicable flags. The AVIF_KEYFRAME flag is defined and indicates that this frame contains all the information needed for a complete image.
     * @param {Pointer<Integer>} plSampWritten Pointer to a buffer used to contain the number of samples written.
     * @param {Pointer<Integer>} plBytesWritten Pointer to a buffer that receives the number of bytes written.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-write
     */
    Write(lStart, lSamples, lpBuffer, cbBuffer, dwFlags, plSampWritten, plBytesWritten) {
        plSampWrittenMarshal := plSampWritten is VarRef ? "int*" : "ptr"
        plBytesWrittenMarshal := plBytesWritten is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, "uint", dwFlags, plSampWrittenMarshal, plSampWritten, plBytesWrittenMarshal, plBytesWritten, "HRESULT")
        return result
    }

    /**
     * The Delete method deletes data from a stream.
     * @remarks
     * For handlers written in C++, <b>Delete</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Delete(LONG lStart, LONG lSamples); 
     *  
     * 
     * ```
     * @param {Integer} lStart Starting sample or frame number to delete.
     * @param {Integer} lSamples Number of samples to delete.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-delete
     */
    Delete(lStart, lSamples) {
        result := ComCall(10, this, "int", lStart, "int", lSamples, "HRESULT")
        return result
    }

    /**
     * The ReadData method reads data headers of a stream. Called when an application uses the AVIStreamReadData function.
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
     * @param {Integer} fcc Four-character code of the stream header to read.
     * @param {Integer} lp Pointer to the buffer to contain the header data.
     * @param {Pointer<Integer>} lpcb Size, in bytes, of the buffer specified by <i>lpBuffer</i>. When this method returns control to the application, the contents of this parameter specifies the amount of data read.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-readdata
     */
    ReadData(fcc, lp, lpcb) {
        lpcbMarshal := lpcb is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "uint", fcc, "ptr", lp, lpcbMarshal, lpcb, "HRESULT")
        return result
    }

    /**
     * The WriteData method writes headers for a stream. Called when an application uses the AVIStreamWriteData function.
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
     * @param {Integer} fcc Four-character code of the stream header to write.
     * @param {Integer} lp Pointer to the buffer that contains the header data to write.
     * @param {Integer} cb Size, in bytes, of the buffer specified by <i>lpBuffer</i>.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-writedata
     */
    WriteData(fcc, lp, cb) {
        result := ComCall(12, this, "uint", fcc, "ptr", lp, "int", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lpInfo 
     * @param {Integer} cbInfo 
     * @returns {HRESULT} 
     */
    SetInfo(lpInfo, cbInfo) {
        result := ComCall(13, this, "ptr", lpInfo, "int", cbInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAVIStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 3)
        this.vtbl.Info := CallbackCreate(GetMethod(implObj, "Info"), flags, 3)
        this.vtbl.FindSample := CallbackCreate(GetMethod(implObj, "FindSample"), flags, 3)
        this.vtbl.ReadFormat := CallbackCreate(GetMethod(implObj, "ReadFormat"), flags, 4)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 4)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 7)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 8)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 3)
        this.vtbl.ReadData := CallbackCreate(GetMethod(implObj, "ReadData"), flags, 4)
        this.vtbl.WriteData := CallbackCreate(GetMethod(implObj, "WriteData"), flags, 4)
        this.vtbl.SetInfo := CallbackCreate(GetMethod(implObj, "SetInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.Info)
        CallbackFree(this.vtbl.FindSample)
        CallbackFree(this.vtbl.ReadFormat)
        CallbackFree(this.vtbl.SetFormat)
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.ReadData)
        CallbackFree(this.vtbl.WriteData)
        CallbackFree(this.vtbl.SetInfo)
    }
}
