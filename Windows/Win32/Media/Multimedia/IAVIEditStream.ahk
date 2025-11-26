#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAVIStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAVIEditStream interface supports manipulating and modifying editable streams. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-iavieditstream
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IAVIEditStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAVIEditStream
     * @type {Guid}
     */
    static IID => Guid("{00020024-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cut", "Copy", "Paste", "Clone", "SetInfo"]

    /**
     * The Cut method removes a portion of a stream and places it in a temporary stream. Called when an application uses the EditStreamCut function.
     * @param {Pointer<Integer>} plStart Pointer to a buffer that receives the starting position of the operation.
     * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the length, in frames, of the operation.
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to the new stream.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iavieditstream-cut
     */
    Cut(plStart, plLength) {
        plStartMarshal := plStart is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", &ppResult := 0, "HRESULT")
        return IAVIStream(ppResult)
    }

    /**
     * The Copy method copies a stream or a portion of it to a temporary stream. Called when an application uses the EditStreamCopy function.
     * @param {Pointer<Integer>} plStart Pointer to a buffer that receives the starting position of the operation.
     * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the length, in frames, of the operation.
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to the new stream.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iavieditstream-copy
     */
    Copy(plStart, plLength) {
        plStartMarshal := plStart is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plStartMarshal, plStart, plLengthMarshal, plLength, "ptr*", &ppResult := 0, "HRESULT")
        return IAVIStream(ppResult)
    }

    /**
     * The Paste method copies a stream or a portion of it in another stream. Called when an application uses the EditStreamPaste function.
     * @param {Pointer<Integer>} plPos Pointer to a buffer that receives the starting position of the operation.
     * @param {Pointer<Integer>} plLength Pointer to a buffer that receives the length, in bytes, of the data to paste from the source stream.
     * @param {IAVIStream} pstream Pointer to the interface to the source stream.
     * @param {Integer} lStart Starting position of the copy operation within the source stream.
     * @param {Integer} lEnd Ending position of the copy operation within the source stream.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iavieditstream-paste
     */
    Paste(plPos, plLength, pstream, lStart, lEnd) {
        plPosMarshal := plPos is VarRef ? "int*" : "ptr"
        plLengthMarshal := plLength is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plPosMarshal, plPos, plLengthMarshal, plLength, "ptr", pstream, "int", lStart, "int", lEnd, "HRESULT")
        return result
    }

    /**
     * The Clone method duplicates a stream. Called when an application uses the EditStreamClone function.
     * @returns {IAVIStream} Pointer to a buffer that receives a pointer to the interface to the new stream.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iavieditstream-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppResult := 0, "HRESULT")
        return IAVIStream(ppResult)
    }

    /**
     * The SetInfo method changes the characteristics of a stream. Called when an application uses the EditStreamSetInfo function.
     * @param {Pointer} lpInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vfw/ns-vfw-avistreaminfoa">AVISTREAMINFO</a> structure containing the new stream characteristics.
     * @param {Integer} cbInfo Size, in bytes, of the buffer.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-iavieditstream-setinfo
     */
    SetInfo(lpInfo, cbInfo) {
        result := ComCall(7, this, "ptr", lpInfo, "int", cbInfo, "HRESULT")
        return result
    }
}
