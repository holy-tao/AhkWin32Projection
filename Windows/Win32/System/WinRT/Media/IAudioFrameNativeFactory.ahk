#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Media
 * @version v4.0.30319
 */
class IAudioFrameNativeFactory extends IInspectable{
    /**
     * The interface identifier for IAudioFrameNativeFactory
     * @type {Guid}
     */
    static IID => Guid("{7bd67cf8-bf7d-43e6-af8d-b170ee0c0110}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<IMFSample>} data 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateFromMFSample(data, forceReadOnly, riid, ppv) {
        result := ComCall(6, this, "ptr", data, "int", forceReadOnly, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
