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
     * 
     * @param {Pointer<UInt32>} pdwCharacteristics 
     * @returns {HRESULT} 
     */
    GetCharacteristics(pdwCharacteristics) {
        result := ComCall(7, this, "uint*", pdwCharacteristics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} ppPresentationDescriptor 
     * @returns {HRESULT} 
     */
    CreatePresentationDescriptor(ppPresentationDescriptor) {
        result := ComCall(8, this, "ptr", ppPresentationDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} pPresentationDescriptor 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<PROPVARIANT>} pvarStartPosition 
     * @returns {HRESULT} 
     */
    Start(pPresentationDescriptor, pguidTimeFormat, pvarStartPosition) {
        result := ComCall(9, this, "ptr", pPresentationDescriptor, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
