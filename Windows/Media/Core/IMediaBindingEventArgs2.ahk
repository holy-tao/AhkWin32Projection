#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaBindingEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBindingEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{0464cceb-bb5a-482f-b8ba-f0284c696567}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAdaptiveMediaSource", "SetStorageFile"]

    /**
     * 
     * @param {AdaptiveMediaSource} mediaSource_ 
     * @returns {HRESULT} 
     */
    SetAdaptiveMediaSource(mediaSource_) {
        result := ComCall(6, this, "ptr", mediaSource_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {HRESULT} 
     */
    SetStorageFile(file_) {
        result := ComCall(7, this, "ptr", file_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
