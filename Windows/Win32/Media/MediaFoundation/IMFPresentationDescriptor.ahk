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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamDescriptorCount", "GetStreamDescriptorByIndex", "SelectStream", "DeselectStream", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} pdwDescriptorCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorcount
     */
    GetStreamDescriptorCount(pdwDescriptorCount) {
        result := ComCall(33, this, "uint*", pdwDescriptorCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<BOOL>} pfSelected 
     * @param {Pointer<IMFStreamDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorbyindex
     */
    GetStreamDescriptorByIndex(dwIndex, pfSelected, ppDescriptor) {
        result := ComCall(34, this, "uint", dwIndex, "ptr", pfSelected, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDescriptorIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationdescriptor-selectstream
     */
    SelectStream(dwDescriptorIndex) {
        result := ComCall(35, this, "uint", dwDescriptorIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDescriptorIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationdescriptor-deselectstream
     */
    DeselectStream(dwDescriptorIndex) {
        result := ComCall(36, this, "uint", dwDescriptorIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} ppPresentationDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpresentationdescriptor-clone
     */
    Clone(ppPresentationDescriptor) {
        result := ComCall(37, this, "ptr*", ppPresentationDescriptor, "HRESULT")
        return result
    }
}
