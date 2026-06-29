#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The IGetFrame interface supports extracting, decompressing, and displaying individual frames from an open stream.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/nn-vfw-igetframe
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct IGetFrame extends IUnknown {
    /**
     * The interface identifier for IGetFrame
     * @type {Guid}
     */
    static IID := Guid("{00020023-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFrame  : IntPtr
        Begin     : IntPtr
        End       : IntPtr
        SetFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetFrame method retrieves a decompressed copy of a frame from a stream. Called when an application uses the AVIStreamGetFrame function.
     * @remarks
     * For handlers written in C++, <b>GetFrame</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * LPVOID GetFrame(LONG lPos); 
     *  
     * 
     * ```
     * @param {Integer} lPos Frame to copy and decompress.
     * @returns {Pointer<Void>} Returns the address of the decompressed frame data.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-getframe
     */
    GetFrame(lPos) {
        result := ComCall(3, this, "int", lPos, IntPtr)
        return result
    }

    /**
     * The Begin method prepares to extract and decompress copies of frames from a stream. Called when an application uses the AVIStreamGetFrameOpen function.
     * @remarks
     * For handlers written in C++, <b>Begin</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT Begin(LONG lStart, LONG lEnd, LONG lRate); 
     *  
     * 
     * ```
     * @param {Integer} lStart Starting frame for extracting and decompressing.
     * @param {Integer} lEnd Ending frame for extracting and decompressing.
     * @param {Integer} lRate Speed at which the file is read relative to its normal playback rate. Normal speed is 1000. Larger values indicate faster speeds; smaller values indicate slower speeds.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-begin
     */
    Begin(lStart, lEnd, lRate) {
        result := ComCall(4, this, "int", lStart, "int", lEnd, "int", lRate, "HRESULT")
        return result
    }

    /**
     * The End method ends frame extraction and decompression. Called when an application uses the AVIStreamGetFrameClose function.
     * @remarks
     * For handlers written in C++, <b>Begin</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT End(VOID); 
     *  
     * 
     * ```
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-end
     */
    End() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The SetFormat method sets the decompressed image format of the frames being extracted and optionally provides a buffer for the decompression operation.
     * @remarks
     * The <i>x</i>, <i>y</i>, <i>dx</i>, and <i>dy</i> parameters identify the portion of the bitmap specified by <i>lpbi</i> and <i>lpBits</i> that receives the decompressed image.
     * 
     * For handlers written in C++, <b>SetFormat</b> has the following syntax:
     * 
     * 
     * ```cpp
     * 
     * HRESULT SetFormat(LPBITMAPINFOHEADER lpbi, LPVOID lpBits, int x, 
     *     int y, int dx, int dy); 
     *  
     * 
     * ```
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure defining the decompressed image format. You can also specify <b>NULL</b> or the value <c>((LPBITMAPINFOHEADER) 1)</code> for this parameter. <b>NULL</b> causes the decompressor to choose a format that is appropriate for editing (normally a 24-bit image depth format). The value <code>((LPBITMAPINFOHEADER) 1)</c> causes the decompressor to choose a format appropriate for the current display mode.
     * @param {Pointer<Void>} lpBits Pointer to a buffer to contain the decompressed image data. Specify <b>NULL</b> to have this method allocate a buffer.
     * @param {Integer} x The x-coordinate of the destination rectangle within the DIB specified by <i>lpbi</i>. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @param {Integer} y The y-coordinate of the destination rectangle within the DIB specified by <i>lpbi</i>. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @param {Integer} dx Width of the destination rectangle. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @param {Integer} dy Height of the destination rectangle. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @returns {HRESULT} Returns <b>NOERROR</b> if successful, <b>E_OUTOFMEMORY</b> if the decompressed image is larger than the buffer size, or <b>E_FAIL</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-setformat
     */
    SetFormat(lpbi, lpBits, x, y, dx, dy) {
        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, BITMAPINFOHEADER.Ptr, lpbi, lpBitsMarshal, lpBits, "int", x, "int", y, "int", dx, "int", dy, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGetFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFrame := CallbackCreate(GetMethod(implObj, "GetFrame"), flags, 2)
        this.vtbl.Begin := CallbackCreate(GetMethod(implObj, "Begin"), flags, 4)
        this.vtbl.End := CallbackCreate(GetMethod(implObj, "End"), flags, 1)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFrame)
        CallbackFree(this.vtbl.Begin)
        CallbackFree(this.vtbl.End)
        CallbackFree(this.vtbl.SetFormat)
    }
}
