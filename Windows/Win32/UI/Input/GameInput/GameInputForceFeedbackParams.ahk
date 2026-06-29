#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputForceFeedbackMagnitude.ahk" { GameInputForceFeedbackMagnitude }
#Import ".\GameInputForceFeedbackConditionParams.ahk" { GameInputForceFeedbackConditionParams }
#Import ".\GameInputForceFeedbackPeriodicParams.ahk" { GameInputForceFeedbackPeriodicParams }
#Import ".\GameInputForceFeedbackRampParams.ahk" { GameInputForceFeedbackRampParams }
#Import ".\GameInputForceFeedbackEnvelope.ahk" { GameInputForceFeedbackEnvelope }
#Import ".\GameInputForceFeedbackEffectKind.ahk" { GameInputForceFeedbackEffectKind }
#Import ".\GameInputForceFeedbackConstantParams.ahk" { GameInputForceFeedbackConstantParams }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackParams {
    #StructPack 8


    struct _data {
        constant : GameInputForceFeedbackConstantParams

        static __New() {
            DefineProp(this.Prototype, 'ramp', { type: GameInputForceFeedbackRampParams, offset: 0 })
            DefineProp(this.Prototype, 'sineWave', { type: GameInputForceFeedbackPeriodicParams, offset: 0 })
            DefineProp(this.Prototype, 'squareWave', { type: GameInputForceFeedbackPeriodicParams, offset: 0 })
            DefineProp(this.Prototype, 'triangleWave', { type: GameInputForceFeedbackPeriodicParams, offset: 0 })
            DefineProp(this.Prototype, 'sawtoothUpWave', { type: GameInputForceFeedbackPeriodicParams, offset: 0 })
            DefineProp(this.Prototype, 'sawtoothDownWave', { type: GameInputForceFeedbackPeriodicParams, offset: 0 })
            DefineProp(this.Prototype, 'spring', { type: GameInputForceFeedbackConditionParams, offset: 0 })
            DefineProp(this.Prototype, 'friction', { type: GameInputForceFeedbackConditionParams, offset: 0 })
            DefineProp(this.Prototype, 'damper', { type: GameInputForceFeedbackConditionParams, offset: 0 })
            DefineProp(this.Prototype, 'inertia', { type: GameInputForceFeedbackConditionParams, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    kind : GameInputForceFeedbackEffectKind

    data : GameInputForceFeedbackParams._data

}
