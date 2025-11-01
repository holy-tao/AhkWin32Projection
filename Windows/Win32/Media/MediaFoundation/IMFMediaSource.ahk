#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Implemented by media source objects.
 * @remarks
 * 
  * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasourceex">IMFMediaSourceEx</a>.
  * 
  * For some device sources, such as cameras or microphones, the **IMFMediaSource** also implements the [IKsControl](/windows-hardware/drivers/ddi/ksproxy/nn-ksproxy-ikscontrol) which can be used by user mode applications to issue KSPROPERTY, KSEVENT and KSMETHOD operations to the underlying device driver.
  * 
  * > [!NOTE] 
  * > This interface is optional and may not be available. If this interface is not available, [QueryInterface](../unknwn/nf-unknwn-iunknown-queryinterface(refiid_void).md) will return E_NOINTERFACE.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSource extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSource
     * @type {Guid}
     */
    static IID => Guid("{279a808d-aec7-40c8-9c6b-a6b492c78a66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCharacteristics", "CreatePresentationDescriptor", "Start", "Stop", "Pause", "Shutdown"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCharacteristics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-getcharacteristics
     */
    GetCharacteristics(pdwCharacteristics) {
        pdwCharacteristicsMarshal := pdwCharacteristics is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwCharacteristicsMarshal, pdwCharacteristics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} ppPresentationDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor
     */
    CreatePresentationDescriptor(ppPresentationDescriptor) {
        result := ComCall(8, this, "ptr*", ppPresentationDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFPresentationDescriptor} pPresentationDescriptor 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<PROPVARIANT>} pvarStartPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-start
     */
    Start(pPresentationDescriptor, pguidTimeFormat, pvarStartPosition) {
        result := ComCall(9, this, "ptr", pPresentationDescriptor, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-stop
     */
    Stop() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-pause
     */
    Pause() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-shutdown
     */
    Shutdown() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
