#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\JointPose.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class IHandPose extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandPose
     * @type {Guid}
     */
    static IID => Guid("{4d98e79a-bb08-5d09-91de-df0dd3fae46c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetJoint", "TryGetJoints", "GetRelativeJoint", "GetRelativeJoints"]

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Integer} joint 
     * @param {Pointer<JointPose>} jointPose_ 
     * @returns {Boolean} 
     */
    TryGetJoint(coordinateSystem, joint, jointPose_) {
        result := ComCall(6, this, "ptr", coordinateSystem, "int", joint, "ptr", jointPose_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Integer} joints_length 
     * @param {Pointer<Integer>} joints 
     * @param {Pointer<Integer>} jointPoses_length 
     * @param {Pointer<Pointer<JointPose>>} jointPoses 
     * @returns {Boolean} 
     */
    TryGetJoints(coordinateSystem, joints_length, joints, jointPoses_length, jointPoses) {
        jointsMarshal := joints is VarRef ? "int*" : "ptr"
        jointPoses_lengthMarshal := jointPoses_length is VarRef ? "uint*" : "ptr"
        jointPosesMarshal := jointPoses is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", coordinateSystem, "uint", joints_length, jointsMarshal, joints, jointPoses_lengthMarshal, jointPoses_length, jointPosesMarshal, jointPoses, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} joint 
     * @param {Integer} referenceJoint 
     * @returns {JointPose} 
     */
    GetRelativeJoint(joint, referenceJoint) {
        result_ := JointPose()
        result := ComCall(8, this, "int", joint, "int", referenceJoint, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} joints_length 
     * @param {Pointer<Integer>} joints 
     * @param {Integer} referenceJoints_length 
     * @param {Pointer<Integer>} referenceJoints 
     * @param {Pointer<Integer>} jointPoses_length 
     * @param {Pointer<Pointer<JointPose>>} jointPoses 
     * @returns {HRESULT} 
     */
    GetRelativeJoints(joints_length, joints, referenceJoints_length, referenceJoints, jointPoses_length, jointPoses) {
        jointsMarshal := joints is VarRef ? "int*" : "ptr"
        referenceJointsMarshal := referenceJoints is VarRef ? "int*" : "ptr"
        jointPoses_lengthMarshal := jointPoses_length is VarRef ? "uint*" : "ptr"
        jointPosesMarshal := jointPoses is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "uint", joints_length, jointsMarshal, joints, "uint", referenceJoints_length, referenceJointsMarshal, referenceJoints, jointPoses_lengthMarshal, jointPoses_length, jointPosesMarshal, jointPoses, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
