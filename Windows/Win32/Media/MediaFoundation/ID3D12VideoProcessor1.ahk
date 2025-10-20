#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoProcessor.ahk

/**
 * Inherits from ID3D12VideoProcessor and provides support for protected resources.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videoprocessor1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoProcessor1 extends ID3D12VideoProcessor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoProcessor1
     * @type {Guid}
     */
    static IID => Guid("{f3cfe615-553f-425c-86d8-ee8c1b1fb01c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProtectedResourceSession"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppProtectedSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocessor1-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid, ppProtectedSession) {
        result := ComCall(12, this, "ptr", riid, "ptr*", ppProtectedSession, "HRESULT")
        return result
    }
}
