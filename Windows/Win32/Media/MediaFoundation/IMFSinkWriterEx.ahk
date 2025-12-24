#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSinkWriter.ahk

/**
 * Extends the IMFSinkWriter interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsinkwriterex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSinkWriterEx extends IMFSinkWriter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSinkWriterEx
     * @type {Guid}
     */
    static IID => Guid("{588d72ab-5bc1-496a-8714-b70617141b25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransformForStream"]

    /**
     * Gets a pointer to a Media Foundation transform (MFT) for a specified stream.
     * @param {Integer} dwStreamIndex The zero-based index of a stream.
     * @param {Integer} dwTransformIndex The zero-based index of the MFT to retreive.
     * @param {Pointer<Guid>} pGuidCategory Receives a pointer to a GUID that specifies the category of the MFT. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {Pointer<IMFTransform>} ppTransform Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface of the MFT. The caller must release the interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriterex-gettransformforstream
     */
    GetTransformForStream(dwStreamIndex, dwTransformIndex, pGuidCategory, ppTransform) {
        result := ComCall(14, this, "uint", dwStreamIndex, "uint", dwTransformIndex, "ptr", pGuidCategory, "ptr*", ppTransform, "HRESULT")
        return result
    }
}
