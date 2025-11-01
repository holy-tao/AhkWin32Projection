#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The realtime-safe interface used to drive the auxiliary inputs of an APO.
 * @remarks
 * This method may be called from a real-time processing thread. The implementation 
  * of these methods must not block, touch paged memory, or call any blocking system routines.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iapoauxiliaryinputrt
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IApoAuxiliaryInputRT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApoAuxiliaryInputRT
     * @type {Guid}
     */
    static IID => Guid("{f851809c-c177-49a0-b1b2-b66f017943ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcceptInput"]

    /**
     * 
     * @param {Integer} dwInputId 
     * @param {Pointer<APO_CONNECTION_PROPERTY>} pInputConnection 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iapoauxiliaryinputrt-acceptinput
     */
    AcceptInput(dwInputId, pInputConnection) {
        ComCall(3, this, "uint", dwInputId, "ptr", pInputConnection)
    }
}
