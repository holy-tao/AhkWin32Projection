#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a callback method for raw image change nofications.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicdeveloprawnotificationcallback
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDevelopRawNotificationCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICDevelopRawNotificationCallback
     * @type {Guid}
     */
    static IID => Guid("{95c75a6e-3e8c-4ec2-85a8-aebcc551e59b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify"]

    /**
     * 
     * @param {Integer} NotificationMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdeveloprawnotificationcallback-notify
     */
    Notify(NotificationMask) {
        result := ComCall(3, this, "uint", NotificationMask, "HRESULT")
        return result
    }
}
