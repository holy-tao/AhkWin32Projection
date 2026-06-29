#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIFFOBJECTATTRIBUTES structure describes the information contained in the &quot;FFAttributes&quot; value of the registry key for each &quot;object&quot; on a force-feedback device.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-diffobjectattributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIFFOBJECTATTRIBUTES {
    #StructPack 4

    /**
     * Specifies the magnitude of the maximum force that can be created by the actuator associated with this object. Force is expressed in Newtons and measured in relation to where the hand would be during <b>Normal</b> operation of the device. If this member is zero, the object is assumed not to support force feedback.
     */
    dwFFMaxForce : UInt32

    /**
     * Specifies the force resolution of the actuator associated with this object. The returned value represents the number of gradations, or subdivisions, of the maximum force that can be expressed by the force feedback system from 0 (no force) to maximum force.
     */
    dwFFForceResolution : UInt32

}
