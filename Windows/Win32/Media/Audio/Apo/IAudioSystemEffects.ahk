#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSystemEffects interface uses the basic methods that are inherited from IUnknown, and must implement an Initialize method.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudiosystemeffects
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioSystemEffects extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSystemEffects
     * @type {Guid}
     */
    static IID => Guid("{5fa00f27-add6-499a-8a9d-6b98521fa75b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
