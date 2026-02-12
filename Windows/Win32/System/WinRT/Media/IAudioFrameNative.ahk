#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * Represents a frame of audio data.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.media.core.interop/nn-windows-media-core-interop-iaudioframenative
 * @namespace Windows.Win32.System.WinRT.Media
 * @version v4.0.30319
 */
class IAudioFrameNative extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioFrameNative
     * @type {Guid}
     */
    static IID => Guid("{20be1e2e-930f-4746-9335-3c332f255093}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData"]

    /**
     * This method returns an interface that provides access to the audio data.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The IID of the interface to retrieve.
     * @returns {Pointer<Pointer<Void>>} Type: **LPVOID\***
     * 
     * When this method returns successfully, contains the interface pointer requested in *riid* parameter.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/iaudioframenative-getdata
     */
    GetData(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
