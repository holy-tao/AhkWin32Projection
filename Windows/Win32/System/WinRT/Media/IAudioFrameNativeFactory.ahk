#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.media.core.interop/nn-windows-media-core-interop-iaudioframenativefactory
 * @namespace Windows.Win32.System.WinRT.Media
 * @version v4.0.30319
 */
class IAudioFrameNativeFactory extends IInspectable{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromMFSample"]

    /**
     * 
     * @param {IMFSample} data 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFromMFSample(data, forceReadOnly, riid) {
        result := ComCall(6, this, "ptr", data, "int", forceReadOnly, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
