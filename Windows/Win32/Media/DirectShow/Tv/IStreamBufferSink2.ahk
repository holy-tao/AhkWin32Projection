#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferSink.ahk

/**
 * The IStreamBufferSink2 interface is exposed by the Stream Buffer Sink filter.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffersink2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferSink2 extends IStreamBufferSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferSink2
     * @type {Guid}
     */
    static IID => Guid("{db94a660-f4fb-4bfa-bcc6-fe159a4eea93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnlockProfile"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersink2-unlockprofile
     */
    UnlockProfile() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
