#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFDeviceTransform.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDeviceTransform2 extends IMFDeviceTransform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDeviceTransform2
     * @type {Guid}
     */
    static IID => Guid("{f5980fed-b521-488f-909f-1a5fcecedb14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransformAttributes"]

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetTransformAttributes(ppAttributes) {
        result := ComCall(23, this, "ptr*", ppAttributes, "HRESULT")
        return result
    }
}
