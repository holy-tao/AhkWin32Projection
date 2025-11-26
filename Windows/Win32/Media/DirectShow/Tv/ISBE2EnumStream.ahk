#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISBE2EnumStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates a collection of streams. This is a utility interface, which you can use to enumerate the streams discovered in a WTV file. The Stream Buffer Source filter implements this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2EnumStream)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2enumstream
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2EnumStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2EnumStream
     * @type {Guid}
     */
    static IID => Guid("{f7611092-9fbc-46ec-a7c7-548ea78b71a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Retrieves the next n streams in the collection.
     * @param {Integer} cRequest The number of streams to retrieve.
     * @param {Pointer<SBE2_STREAM_DESC>} pStreamDesc Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ns-sbe-sbe2_stream_desc">SBE2_STREAM_DESC</a> structures, with at least <i>cRequest</i> elements. The method copies up to <i>cRequest</i> elements into the array.
     * @returns {Integer} Receives the number of elements returned in the <i>pStreamDesc</i> array. This parameter can be <b>NULL</b> if <i>cRequest</i> is 1.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2enumstream-next
     */
    Next(cRequest, pStreamDesc) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamDesc, "uint*", &pcReceived := 0, "HRESULT")
        return pcReceived
    }

    /**
     * Skips a specified number of streams in the enumeration sequence.
     * @param {Integer} cRecords The number of streams to skip.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The end of the sequence was reached before skipping the requested number of streams.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2enumstream-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2enumstream-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the enumerator object. The copy starts with the same enumeration state as the original.
     * @returns {ISBE2EnumStream} Receives a pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-isbe2enumstream">ISBE2EnumStream</a> interface of the new enumerator object. This method allocates memory for the stream enumeration object. The caller is responsible for releasing the interface.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2enumstream-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumStream := 0, "HRESULT")
        return ISBE2EnumStream(ppIEnumStream)
    }
}
