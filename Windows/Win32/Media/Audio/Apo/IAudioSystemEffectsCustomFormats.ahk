#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioMediaType.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSystemEffectsCustomFormats interface is supported in Windows Vista and later versions of Windows.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudiosystemeffectscustomformats
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioSystemEffectsCustomFormats extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSystemEffectsCustomFormats
     * @type {Guid}
     */
    static IID => Guid("{b1176e34-bb7f-4f05-bebd-1b18a534e097}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormatCount", "GetFormat", "GetFormatRepresentation"]

    /**
     * The GetFormatCount method retrieves the number of custom formats supported by the system effects audio processing object (sAPO).
     * @returns {Integer} Specifies a pointer to an unsigned integer. The unsigned integer represents the number of formats supported by the sAPO.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatcount
     */
    GetFormatCount() {
        result := ComCall(3, this, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * The GetFormat method retrieves an IAudioMediaType representation of a custom format.
     * @param {Integer} nFormat Specifies the index of a supported format. This parameter can be any value in the range from zero to one less than the return value of <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatcount">GetFormatCount</a>. In other words, any value in the range from zero to GetFormatCount( ) - 1.
     * @returns {IAudioMediaType} Specifies a pointer to a pointer to an <b>IAudioMediaType</b> interface. It is the responsibility of the caller to release the <b>IAudioMediaType</b> interface to which the <i>ppFormat</i> parameter points.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformat
     */
    GetFormat(nFormat) {
        result := ComCall(4, this, "uint", nFormat, "ptr*", &ppFormat := 0, "HRESULT")
        return IAudioMediaType(ppFormat)
    }

    /**
     * The GetFormatRepresentation method retrieves a string representation of the custom format so that it can be displayed on a user-interface.
     * @param {Integer} nFormat Specifies the index of a supported format. This parameter can be any value in the range from zero to one less than the return value of <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatcount">GetFormatCount</a>. In other words, any value in the range from zero to GetFormatCount( ) - 1.
     * @returns {PWSTR} Specifies the address of the buffer that receives a NULL-terminated Unicode string that describes the custom format.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatrepresentation
     */
    GetFormatRepresentation(nFormat) {
        result := ComCall(5, this, "uint", nFormat, "ptr*", &ppwstrFormatRep := 0, "HRESULT")
        return ppwstrFormatRep
    }
}
