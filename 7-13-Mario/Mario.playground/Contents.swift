/*:
 # Mario
 
 Add your Mario solution (however far you got) to the space below.
 
 Then, commit your work.
 
 Finally, push your work to the remote origin for your repository on GitHub.com.
 
 We will go through this together.
 */

// Add your code below
func levelCost(heights: [Int], maxJump: Int) -> Int {
    var energy = 0
    var lastHeight = 0
    
    for i in heights {
     lastHeight = heights[i+1]-heights[i]
        if lastHeight <= maxJump{
            if lastHeight == 0{
            energy += 1
            } else {
                energy+=abs(lastHeight*2)
            }
        } else {
            energy = -1
            break
        }
    }
return energy
}

