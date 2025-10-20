#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Describes the details of a presentation. A presentation is a set of related media streams that share a common presentation time.
 * @remarks
 * 
  * Presentation descriptors are used to configure media sources and some media sinks. To get the presentation descriptor from a media source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor">IMFMediaSource::CreatePresentationDescriptor</a>. To create a new presentation descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepresentationdescriptor">MFCreatePresentationDescriptor</a>.
  * 
  * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
  * 
  * <ul>
  * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
  * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfpresentationdescriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPresentationDescriptor extends IMFAttributes{
    /**
     * The interface identifier for IMFPresentationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{03cb2711-24d7-4db6-a17f-f3a7a479a536}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * 
     * @param {Pointer<UInt32>} pdwDescriptorCount 
     * @returns {HRESULT} 
     */
    GetStreamDescriptorCount(pdwDescriptorCount) {
        result := ComCall(33, this, "uint*", pdwDescriptorCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<BOOL>} pfSelected 
     * @param {Pointer<IMFStreamDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     */
    GetStreamDescriptorByIndex(dwIndex, pfSelected, ppDescriptor) {
        result := ComCall(34, this, "uint", dwIndex, "ptr", pfSelected, "ptr", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDescriptorIndex 
     * @returns {HRESULT} 
     */
    SelectStream(dwDescriptorIndex) {
        result := ComCall(35, this, "uint", dwDescriptorIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDescriptorIndex 
     * @returns {HRESULT} 
     */
    DeselectStream(dwDescriptorIndex) {
        result := ComCall(36, this, "uint", dwDescriptorIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} ppPresentationDescriptor 
     * @returns {HRESULT} 
     */
    Clone(ppPresentationDescriptor) {
        result := ComCall(37, this, "ptr", ppPresentationDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
