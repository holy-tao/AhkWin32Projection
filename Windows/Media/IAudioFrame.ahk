#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AudioBuffer.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a frame of audio data.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.media.core.interop/nn-windows-media-core-interop-iaudioframenative
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IAudioFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioFrame
     * @type {Guid}
     */
    static IID => Guid("{e36ac304-aab2-4277-9ed0-43cedf8e29c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockBuffer"]

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {AudioBuffer} 
     */
    LockBuffer(mode_) {
        result := ComCall(6, this, "int", mode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioBuffer(value)
    }
}
