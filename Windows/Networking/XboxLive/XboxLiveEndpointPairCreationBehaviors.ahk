#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify creation behavior options for an **XboxLiveEndpointPair** creation operation.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpaircreationbehaviors
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveEndpointPairCreationBehaviors extends Win32BitflagEnum{

    /**
     * Specifies the default operation. If **XboxLiveEndpointPairTemplate.CreateEndpointPairAsync** or **XboxLiveEndpointPairTemplate.CreateEndpointPairForPortsAsync** are called with a template that has already been used to establish an **XboxLiveEndpointPair** to the remote **XboxLiveDeviceAddress**, then the same **XboxLiveEndpointPair** is returned, and no **XboxLiveEndpointPairTemplate.InboundEndpointPairCreated** event is raised.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Specifies that, if **XboxLiveEndpointPairTemplate.CreateEndpointPairAsync** or **XboxLiveEndpointPairTemplate.CreateEndpointPairForPortsAsync** are called with a template that has already been used to establish an **XboxLiveEndpointPair** to the remote **XboxLiveDeviceAddress**, then the method re-evaluates all potential network paths according to the template's quality requirements. If the same network path is selected again, then the same **XboxLiveEndpointPair** is returned. If a new path is found, then the old **XboxLiveEndpointPair** is destroyed, and a new one returned.
     * @type {Integer (UInt32)}
     */
    static ReevaluatePath => 1
}
