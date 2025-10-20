#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfTransitoryExtensionSink interface is implemented by the application that uses Transitory Extension dim. The application can track the changes that happened in the transitory extension by using this sink interface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftransitoryextensionsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTransitoryExtensionSink extends IUnknown{
    /**
     * The interface identifier for ITfTransitoryExtensionSink
     * @type {Guid}
     */
    static IID => Guid("{a615096f-1c57-4813-8a15-55ee6e5a839c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {Integer} ecReadOnly 
     * @param {Pointer<ITfRange>} pResultRange 
     * @param {Pointer<ITfRange>} pCompositionRange 
     * @param {Pointer<BOOL>} pfDeleteResultRange 
     * @returns {HRESULT} 
     */
    OnTransitoryExtensionUpdated(pic, ecReadOnly, pResultRange, pCompositionRange, pfDeleteResultRange) {
        result := ComCall(3, this, "ptr", pic, "uint", ecReadOnly, "ptr", pResultRange, "ptr", pCompositionRange, "ptr", pfDeleteResultRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
