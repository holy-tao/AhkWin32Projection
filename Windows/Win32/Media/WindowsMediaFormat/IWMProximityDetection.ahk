#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMProximityDetection interface validates a playback device for receiving media data.
 * @remarks
 * 
 * The validation state is stored in the device registration database. You can check the validation state for a device by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid">IWMRegisteredDevice::IsValid</a>.
 * 
 * Validation expires after 48 hours.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmproximitydetection
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProximityDetection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMProximityDetection
     * @type {Guid}
     */
    static IID => Guid("{6a9fd8ee-b651-4bf0-b849-7d4ece79a2b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartDetection"]

    /**
     * The StartDetection method begins the proximity detection process. After calling this method, do not release the IWMProximityDetection until you recieve the WMT_PROXIMITY_COMPLETED message.
     * @param {Pointer<Integer>} pbRegistrationMsg Address of the registration message in memory. This message is received by your application from the device.
     * @param {Integer} cbRegistrationMsg Size of registration message in bytes.
     * @param {Pointer<Integer>} pbLocalAddress Address of a <b>SOCKADDR_STORAGE</b> structure that contains the address of the local network interface to be used during proximity detection. If the <i>dwExtraPortsAllowed</i> parameter is not 0, the port number specified in the SOCKADDR_STORAGE structure identifies the beginning of the range of ports that will be tried.
     * @param {Integer} cbLocalAddress Size of the structure pointed to by <i>pbLocalAddress</i>. Set to <c>sizeof(SOCKADDR_STORAGE)</c>.
     * @param {Integer} dwExtraPortsAllowed Specifies the number of additional ports that the method will attempt to use if the previous ports were not successfully used. The method always attempts to use the port specified in the <i>pbLocalAddress</i> parameter first. If that attempt fails, then the method makes a number of additional attempts up to the value of this parameter. On each subsequent attempt, the port number is incremented. So if the port number in <i>pbLocalAddress</i> is 5000, and <i>dwExtraPortsAllowed</i> is set to 20, the method will start with port 5000 and, if necessary, try ports 5001 through 5020.
     * @param {IWMStatusCallback} pCallback Address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface that will receive proximity detection status messages.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This is passed to the application in calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback. You can use this parameter to differentiate between messages from different objects when sharing a single status callback.
     * @returns {INSSBuffer} Address of a variable that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on the buffer object containing the registration response message. You must send this message data to the device.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmproximitydetection-startdetection
     */
    StartDetection(pbRegistrationMsg, cbRegistrationMsg, pbLocalAddress, cbLocalAddress, dwExtraPortsAllowed, pCallback, pvContext) {
        pbRegistrationMsgMarshal := pbRegistrationMsg is VarRef ? "char*" : "ptr"
        pbLocalAddressMarshal := pbLocalAddress is VarRef ? "char*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pbRegistrationMsgMarshal, pbRegistrationMsg, "uint", cbRegistrationMsg, pbLocalAddressMarshal, pbLocalAddress, "uint", cbLocalAddress, "uint", dwExtraPortsAllowed, "ptr*", &ppRegistrationResponseMsg := 0, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppRegistrationResponseMsg)
    }
}
