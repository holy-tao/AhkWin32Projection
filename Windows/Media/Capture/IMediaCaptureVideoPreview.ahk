#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureVideoPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureVideoPreview
     * @type {Guid}
     */
    static IID => Guid("{27727073-549e-447f-a20a-4f03c479d8c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartPreviewAsync", "StartPreviewToCustomSinkAsync", "StartPreviewToCustomSinkIdAsync", "StopPreviewAsync"]

    /**
     * 
     * @returns {IAsyncAction} 
     */
    StartPreviewAsync() {
        result := ComCall(6, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {IMediaExtension} customMediaSink 
     * @returns {IAsyncAction} 
     */
    StartPreviewToCustomSinkAsync(encodingProfile, customMediaSink) {
        result := ComCall(7, this, "ptr", encodingProfile, "ptr", customMediaSink, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {HSTRING} customSinkActivationId 
     * @param {IPropertySet} customSinkSettings 
     * @returns {IAsyncAction} 
     */
    StartPreviewToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings) {
        if(customSinkActivationId is String) {
            pin := HSTRING.Create(customSinkActivationId)
            customSinkActivationId := pin.Value
        }
        customSinkActivationId := customSinkActivationId is Win32Handle ? NumGet(customSinkActivationId, "ptr") : customSinkActivationId

        result := ComCall(8, this, "ptr", encodingProfile, "ptr", customSinkActivationId, "ptr", customSinkSettings, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    StopPreviewAsync() {
        result := ComCall(9, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
