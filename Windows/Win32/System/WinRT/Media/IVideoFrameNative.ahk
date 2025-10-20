#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.media.core.interop/nn-windows-media-core-interop-ivideoframenative
 * @namespace Windows.Win32.System.WinRT.Media
 * @version v4.0.30319
 */
class IVideoFrameNative extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrameNative
     * @type {Guid}
     */
    static IID => Guid("{26ba702b-314a-4620-aaf6-7a51aa58fa18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData", "GetDevice"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinRT/ivideoframenative-getdata
     */
    GetData(riid, ppv) {
        result := ComCall(6, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinRT/ivideoframenative-getdevice
     */
    GetDevice(riid, ppv) {
        result := ComCall(7, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
